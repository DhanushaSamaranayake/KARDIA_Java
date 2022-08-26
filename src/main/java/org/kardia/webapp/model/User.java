package org.kardia.webapp.model;

import lombok.Getter;
import lombok.Setter;
import lombok.extern.slf4j.Slf4j;

import javax.persistence.*;
import java.util.List;
import java.util.Set;

@Getter
@Setter
@Slf4j
@Entity
@Table(name="user")
public class User {

	@Id
	@GeneratedValue(strategy  = GenerationType.IDENTITY)
	@Column(name="user_id")
	private long id;
	
	@Column(name="first_name", nullable = false)
	private String firstName;

	@Column(name="last_name")
	private String lastName;

	@Column(name="email", nullable = false, unique = true)
	private String email;

	@Column(name="contact_number", nullable = false, unique = true)
	private String contactNumber;

	@Column(name = "address", nullable = false)
	private String address;

	private String profileUri;
	@Column(name="password", nullable = false)
	private String password;

	@Transient
	private String passwordConfirm;

	@ManyToMany(
			targetEntity = Role.class
	)
	private Set<Role> roles;

	@OneToMany(
			fetch = FetchType.LAZY,
			mappedBy = "user"
	)
	private List<Prediction> predictions;

	public User() {
	}

	public User(String firstName, String lastName, String email, String address, String contactNumber, String profileUri
			, String password) {
		this.firstName = firstName;
		this.lastName = lastName;
		this.email = email;
		this.address = address;
		this.contactNumber = contactNumber;
		this.profileUri = profileUri;
		this.password = password;
	}

	public User(String email, String password) {
		this.email = email;
		this.password = password;
	}
}
