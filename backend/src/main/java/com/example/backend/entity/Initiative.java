package com.example.backend.entity;

import java.time.LocalDate;
import java.util.Set;

import com.fasterxml.jackson.annotation.JsonIgnore;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.JoinTable;
import jakarta.persistence.ManyToMany;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.OneToMany;
import jakarta.persistence.Table;
import lombok.*;

@Entity
@Table(name = "initiative")
@Getter
@Setter
@NoArgsConstructor
@RequiredArgsConstructor

public class Initiative {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id", nullable = false)
    private Long id;

    @NonNull
    @Column(name = "description", nullable = false)
    private String description;

    @NonNull
    @Column(name = "solution", nullable = false)
    private String solution;

    @NonNull
    @Column(name = "createdAt", nullable = false)
    private LocalDate createdAt;
   
    @NonNull
    @Column(name = "initiativePictureUrl", length = 1000)
    private String initiativePictureUrl;
    
    @NonNull
    @ManyToOne(optional = false)
    @JoinColumn(name = "jonogon_id", referencedColumnName = "id", nullable = false)
    private Jonogon jonogon;

    @JsonIgnore
    @ManyToMany()
    @JoinTable(name = "jonogon_appreciated_initiatives", joinColumns = @JoinColumn(name = "initiative_id"), inverseJoinColumns = @JoinColumn(name = "jonogon_id"))
    private Set<Jonogon> appreciators;

    @JsonIgnore
    @ManyToMany()
    @JoinTable(name = "jonogon_iAmIn_initiatives", joinColumns = @JoinColumn(name = "initiative_id"), inverseJoinColumns = @JoinColumn(name = "jonogon_id"))
    private Set<Jonogon> iAmInJonogons;

    @JsonIgnore
    @OneToMany(mappedBy = "initiative")
    private Set<Comment> comments;

    @OneToMany(mappedBy = "initiative")
    private Set<Step> steps;
}
