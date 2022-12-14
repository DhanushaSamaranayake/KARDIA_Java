package org.kardia.webapp.repo;

import org.kardia.webapp.model.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.Optional;

@Repository
public interface UserRepository extends JpaRepository<User, Long> {
	// finding users by email
	Optional<User> findUserByEmail(String email);
	Boolean existsByEmail(String email);
}
