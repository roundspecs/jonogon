package com.example.backend.entity;

import java.time.LocalDate;
import java.util.List;
import java.util.Set;

import com.fasterxml.jackson.annotation.JsonIgnore;

import jakarta.annotation.Nonnull;
import jakarta.persistence.*;
import lombok.*;

@NoArgsConstructor
@RequiredArgsConstructor
@Getter
@Setter
@Entity
@Table(name = "jonogon")
public class Jonogon {

 

  @Id
  @GeneratedValue(strategy = GenerationType.IDENTITY)
  @Column(name = "id", nullable = false)
  private Long id;

  @Nonnull
  @Column(name = "username", nullable = false)
  private String username;

  @Nonnull
  @Column(name = "fullname", nullable = false)
  private String fullname;

  @Nonnull
  @Column(name = "phoneNumber", nullable = false)
  private String phoneNumber;

  @Nonnull
  @Column(name = "password", nullable = false)
  private String password;

  @Nonnull
  @Column(name = "userSince", nullable = false)
  private LocalDate userSince;

  @Nonnull
  @ElementCollection(fetch = FetchType.EAGER)
  @CollectionTable(name = "jonogon_skills", joinColumns = @JoinColumn(name = "jonogon_id"))
  @Column(name = "skills")
  private Set<String> skills;

  @Nonnull
  @Column(name = "profilePictureURL", length = 1000)
  private String profilePictureURL;

  @JsonIgnore
  @OneToMany(mappedBy = "jonogon")
  private List<Initiative> initiatives;

  @JsonIgnore
  @ManyToMany(mappedBy = "appreciators")
  private Set<Initiative> appreciatedInitiatives;

  @ManyToMany(mappedBy = "iAmInJonogons")
  private Set<Initiative> iAmInitiatives;

  @JsonIgnore
  @OneToMany(mappedBy = "jonogon")
  private List<Comment> comments;
}
