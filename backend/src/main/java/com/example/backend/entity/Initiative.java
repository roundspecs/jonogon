package com.example.backend.entity;

import java.time.LocalDate;
import java.util.Set;

import jakarta.annotation.Nonnull;
import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
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
    @Column(name = "jonogonId")
    private Long jonogonId;

    @Nonnull
    @Column(name = "description")
    private String decscription;

    @Nonnull
    @Column(name = "createdAt")
    private LocalDate createdAt;

    @Nonnull
    @Column(name = "solution")
    private String solution;

    @Nonnull
    @Column(name = "steps")
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
    @Column(name = "imageUrl", length = 1000)
    private String imageUrl;

    private Set<Jonogon> appreciators;

    private Set<Jonogon> iAmInJonogons;

    private Set<Comment> comments;

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
