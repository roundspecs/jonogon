package com.example.backend.entity;

import java.util.Set;

import com.fasterxml.jackson.annotation.JsonIgnore;

import jakarta.annotation.Nonnull;
import jakarta.persistence.CascadeType;
import jakarta.persistence.CollectionTable;
import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.JoinTable;
import jakarta.persistence.OneToMany;
import jakarta.persistence.Table;
import lombok.*;

@Getter
@Setter
@NoArgsConstructor
@RequiredArgsConstructor
@Entity
@Table(name = "jonogon")

public class Jonogon {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private Long id;

    @Nonnull
    @Column(name = "username")
    private String userName;

    @Nonnull
    @Column(name = "fullName")
    private String fullName;

    @Nonnull
    @Column(name = "phoneNumber")
    private String phoneNumber;

    @Nonnull
    @Column(name = "password")
    private String password;

    @Nonnull
    @Column(name = "imageUrl", length = 1000)
    private String imageUrl;

    @Nonnull
    @CollectionTable(name = "skills", joinColumns = @JoinColumn(name = "jonogon_id"))
    private Set<String> skills;

    @JsonIgnore
    @JoinTable(name = "jonogon_taken_initiatives", joinColumns = @JoinColumn(name = "initiative_id"), inverseJoinColumns = @JoinColumn(name = "jonogon_id"))
    @OneToMany(mappedBy = "jonogon", cascade = CascadeType.ALL)
    private Set<Initiative> initiativesTaken;

    @JsonIgnore
    @JoinTable(name = "jonogon_appriciate_initiatives", joinColumns = @JoinColumn(name = "initiative_id"), inverseJoinColumns = @JoinColumn(name = "jonogon_id"))
    @OneToMany(mappedBy = "jonogon", cascade = CascadeType.ALL)
    private Set<Initiative> initiativesAppricatived;

    @JsonIgnore
    @JoinTable(name = "jonogon_iAmIn_initiatives", joinColumns = @JoinColumn(name = "initiative_id"), inverseJoinColumns = @JoinColumn(name = "jonogon_id"))
    @OneToMany(mappedBy = "jonogon", cascade = CascadeType.ALL)
    private Set<Initiative> initiativesIAmIn;

}
