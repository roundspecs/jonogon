package com.example.backend.entity;

import java.util.List;
import java.util.Set;

import com.fasterxml.jackson.annotation.JsonIgnore;

import jakarta.annotation.Nonnull;
import jakarta.persistence.CollectionTable;
import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToMany;
import jakarta.persistence.OneToMany;
import jakarta.persistence.Table;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.RequiredArgsConstructor;
import lombok.Setter;

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
    @Column(name = "image_url", length = 1000)
    private String imageUrl;

    @Nonnull
    @CollectionTable(name = "skills", joinColumns = @JoinColumn(name = "jonogon_id"))
    private Set<String> skills;

    @JsonIgnore
    @OneToMany(mappedBy = "author")
    private List<Initiative> initiatives;

    @JsonIgnore
    @ManyToMany(mappedBy = "appreciators")
    private Set<Initiative> appreciatedInitiatives;

    @JsonIgnore
    @ManyToMany(mappedBy = "iAmInJonogons")
    private Set<Initiative> iAmInitiatives;

}
