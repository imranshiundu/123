package com.example.moviesapi.service;

import java.time.LocalDate;
import java.time.format.DateTimeParseException;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.example.moviesapi.exception.InvalidRequestException;
import com.example.moviesapi.exception.ResourceNotFoundException;
import com.example.moviesapi.model.Actor;
import com.example.moviesapi.model.Movie;
import com.example.moviesapi.repository.ActorRepository;

@Service
@Transactional
public class ActorService {

    private final ActorRepository actorRepository;

    @Autowired
    public ActorService(ActorRepository actorRepository) {
        this.actorRepository = actorRepository;
    }

    // CREATE
    public Actor createActor(Actor actor) {
        // Validate required fields
        if (actor.getName() == null || actor.getName().trim().isEmpty()) {
            throw new InvalidRequestException("Actor name is required");
        }
        if (actor.getBirthDate() == null) {
            throw new InvalidRequestException("Birth date is required");
        }

        // Validate birth date is not in the future
        if (actor.getBirthDate().isAfter(LocalDate.now())) {
            throw new InvalidRequestException("Birth date cannot be in the future");
        }

        // Check if actor with same name and birth date already exists
        if (actorRepository.existsByNameAndBirthDate(actor.getName().trim(), actor.getBirthDate())) {
            throw new InvalidRequestException("Actor with name '" + actor.getName() + 
                "' and birth date '" + actor.getBirthDate() + "' already exists");
        }

        // Ensure name is trimmed
        actor.setName(actor.getName().trim());

        return actorRepository.save(actor);
    }

    // READ ALL
    @Transactional(readOnly = true)
    public List<Actor> getAllActors() {
        return actorRepository.findAll();
    }

    @Transactional(readOnly = true)
    public Page<Actor> getAllActors(Pageable pageable) {
        return actorRepository.findAll(pageable);
    }

    // READ BY ID
    @Transactional(readOnly = true)
    public Actor getActorById(Long id) {
        return actorRepository.findById(id)
                .orElseThrow(() -> new ResourceNotFoundException("Actor not found with id: " + id));
    }

    // GET MOVIES BY ACTOR
    @Transactional(readOnly = true)
    public List<Movie> getMoviesByActorId(Long actorId) {
        Actor actor = getActorById(actorId);
        return List.copyOf(actor.getMovies());
    }

    // SEARCH BY NAME
    @Transactional(readOnly = true)
    public Page<Actor> searchActorsByName(String name, Pageable pageable) {
        if (name == null || name.trim().isEmpty()) {
            throw new InvalidRequestException("Search name cannot be empty");
        }
        return actorRepository.findByNameContainingIgnoreCase(name.trim(), pageable);
    }

    // PARTIAL UPDATE
    public Actor partialUpdateActor(Long id, Map<String, Object> updates) {
        Actor actor = getActorById(id);
        
        updates.forEach((key, value) -> {
            switch (key) {
                case "name":
                    if (value != null) {
                        String newName = value.toString().trim();
                        if (!newName.isEmpty()) {
                            // Check for duplicate name with same birth date
                            if (actorRepository.existsByNameAndBirthDate(newName, actor.getBirthDate()) && 
                                !actor.getName().equals(newName)) {
                                throw new InvalidRequestException("Actor with name '" + newName + 
                                    "' and birth date '" + actor.getBirthDate() + "' already exists");
                            }
                            actor.setName(newName);
                        } else {
                            throw new InvalidRequestException("Actor name cannot be empty");
                        }
                    }
                    break;
                    
                case "birthDate":
                    if (value != null) {
                        try {
                            LocalDate newBirthDate = LocalDate.parse(value.toString());
                            if (newBirthDate.isAfter(LocalDate.now())) {
                                throw new InvalidRequestException("Birth date cannot be in the future");
                            }
                            // Check for duplicate name with new birth date
                            if (actorRepository.existsByNameAndBirthDate(actor.getName(), newBirthDate) && 
                                !actor.getBirthDate().equals(newBirthDate)) {
                                throw new InvalidRequestException("Actor with name '" + actor.getName() + 
                                    "' and birth date '" + newBirthDate + "' already exists");
                            }
                            actor.setBirthDate(newBirthDate);
                        } catch (DateTimeParseException e) {
                            throw new InvalidRequestException("Invalid birth date format. Use yyyy-MM-dd");
                        }
                    }
                    break;
                    
                default:
                    // Ignore unknown fields for partial update
                    break;
            }
        });

        return actorRepository.save(actor);
    }

    // DELETE
    public void deleteActor(Long id, boolean force) {
        Actor actor = getActorById(id);
        
        if (!force && !actor.getMovies().isEmpty()) {
            int movieCount = actor.getMovies().size();
            throw new InvalidRequestException(
                "Cannot delete actor '" + actor.getName() + 
                "' because they are associated with " + movieCount + " movie" + 
                (movieCount > 1 ? "s" : "") + ". Use force=true to delete anyway."
            );
        }

        // If force=true, remove relationships before deletion
        if (force) {
            // Create a copy to avoid ConcurrentModificationException
            List<Movie> movies = List.copyOf(actor.getMovies());
            for (Movie movie : movies) {
                movie.removeActor(actor);
            }
        }

        actorRepository.delete(actor);
    }

    // VALIDATION
    @Transactional(readOnly = true)
    public boolean actorExists(Long id) {
        return actorRepository.existsById(id);
    }

    // BULK GET ACTORS BY IDS
    @Transactional(readOnly = true)
    public List<Actor> getActorsByIds(List<Long> actorIds) {
        return actorRepository.findAllById(actorIds);
    }
}