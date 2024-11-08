package com.example.backend.entity;

import java.time.LocalDate;
import java.util.Set;

import com.fasterxml.jackson.annotation.JsonIgnore;

import jakarta.annotation.Nonnull;
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

@Getter
@Setter
@NoArgsConstructor
@RequiredArgsConstructor
@Entity
@Table(name = "initiative")
public class Initiative {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private Long id;

    @Nonnull
    @Column(name = "jonogon_id")
    private Long jonogonId;

    @Nonnull
    @Column(name = "description")
    private String decscription;

    @Nonnull
    @Column(name = "createdAt")
    private LocalDate createdAt;

    @Nonnull
    @Column(name = "solution", length = 1000)
    private String solution;
   
    @OneToMany(mappedBy = "initiative")
    private Set<Step> steps;
   
    @Nonnull
    @Column(name = "appricateCount")
    private Long appriciateCount;

    @Nonnull
    @Column(name = "iAmInCount")
    private Long iAmInCount;

    @Nonnull
    @Column(name = "commentCount")
    private Long commentCount;

    @Nonnull
    @Column(name = "imageURL", length = 1000)
    private String imageUrl;

    @JsonIgnore
    @OneToMany(mappedBy = "initiative")
    private Set<Comment> comments;

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

    @Nonnull
    @Column(name = "location_district")
    private String location_district;
    @Nonnull
    @Column(name = "location_upzilla")
    private String location_upzilla;
    @Nonnull
    @Column(name = "location_address")
    private String location_address;

}
