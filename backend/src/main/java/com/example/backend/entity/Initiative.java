package com.example.backend.entity;

import java.time.LocalDate;
import java.util.List;
import java.util.Set;

import com.fasterxml.jackson.annotation.JsonIgnore;

import jakarta.annotation.Nonnull;
import jakarta.persistence.*;
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
    @Column(name = "description")
    private String decscription;

    @Nonnull
    @Column(name = "created_at")
    private LocalDate createdAt;

    @Nonnull
    @Column(name = "solution", length = 1000)
    private String solution;
   
    @OneToMany(mappedBy = "initiative")
    private List<Step> steps;
   
    @Nonnull
    @Column(name = "appricate_count")
    private Integer appriciateCount;

    @Nonnull
    @Column(name = "i_am_in_count")
    private Integer iAmInCount;

    @Nonnull
    @Column(name = "comment_count")
    private Integer commentCount;

    @Nonnull
    @Column(name = "image_url", length = 1000)
    private String imageUrl;

    // @JsonIgnore
    // @OneToMany(mappedBy = "initiative")
    // private Set<Comment> comments;

    @NonNull
    @ManyToOne(optional = false)
    @JoinColumn(name = "jonogon_id", referencedColumnName = "id", nullable = false)
    private Jonogon author;

    @NonNull
    @JsonIgnore
    @ManyToMany()
    @JoinTable(name = "jonogon_appreciated_initiatives", joinColumns = @JoinColumn(name = "initiative_id"), inverseJoinColumns = @JoinColumn(name = "jonogon_id"))
    private Set<Jonogon> appreciators;

    @NonNull
    @JsonIgnore
    @ManyToMany()
    @JoinTable(name = "jonogon_i_am_in_initiatives", joinColumns = @JoinColumn(name = "initiative_id"), inverseJoinColumns = @JoinColumn(name = "jonogon_id"))
    private Set<Jonogon> iAmInJonogons;

    @Nonnull
    @Column(name = "location_district")
    private String locationDistrict;

    @Nonnull
    @Column(name = "location_upzilla")
    private String locationUpzilla;

    @Nonnull
    @Column(name = "location_address")
    private String locationAddress;

}
