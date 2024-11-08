package com.example.backend.entity;

import com.fasterxml.jackson.annotation.JsonIgnore;

import jakarta.annotation.Nonnull;
import jakarta.persistence.*;
import lombok.*;

@Getter
@Setter
@NoArgsConstructor
@RequiredArgsConstructor
@Entity
@Table(name = "jonogon")
public class Step {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private Long id;

    @Nonnull
    @Column(name = "content")
    private String content;

    @JsonIgnore
    @NonNull
    @ManyToOne(optional = false)
    @JoinColumn(name = "initiative_id", referencedColumnName = "id", nullable = false)
    private Initiative initiative;

    @Nonnull
    @Column(name = "isComplete")
    private Boolean isComplete;
}
