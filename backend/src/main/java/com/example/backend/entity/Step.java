package com.example.backend.entity;

import com.fasterxml.jackson.annotation.JsonIgnore;

import jakarta.annotation.Nonnull;
import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Table;
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
