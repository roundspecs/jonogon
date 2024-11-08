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
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.RequiredArgsConstructor;
import lombok.Setter;

@NoArgsConstructor
@RequiredArgsConstructor
@Getter
@Setter
@Entity
@Table(name = "step")
public class Step {
  @Id
  @GeneratedValue(strategy = GenerationType.IDENTITY)
  @Column(name = "id", nullable = false)
  private Long id;

  @Nonnull
  @Column(name = "content", nullable = false)
  private String content;

  @Nonnull
  @Column(name = "step_order", nullable = false)
  private Integer order;

  @Nonnull
  @JsonIgnore
  @ManyToOne(optional = false)
  @JoinColumn(name = "initiative_id", referencedColumnName = "id", nullable = false)
  private Initiative initiative;
}
