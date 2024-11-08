package com.example.backend.entity;

import java.time.LocalDate;

import com.fasterxml.jackson.annotation.JsonIgnore;

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
import lombok.NonNull;
import lombok.RequiredArgsConstructor;
import lombok.Setter;

@NoArgsConstructor
@RequiredArgsConstructor
@Getter
@Setter
@Entity
@Table(name = "comment")
public class Comment {
  @Id
  @GeneratedValue(strategy = GenerationType.IDENTITY)
  private Long id;

  @NonNull
  @Column(name = "content", nullable = false)
  private String content;

  @NonNull
  @Column(name = "createdAt", nullable = false)
  private LocalDate createdAt;

  @NonNull
  @ManyToOne(optional = false)
  @JoinColumn(name = "jonogon_id", referencedColumnName = "id", nullable = false)
  private Jonogon jonogon;

  @JsonIgnore
  @NonNull
  @ManyToOne(optional = false)
  @JoinColumn(name = "initiative_id", referencedColumnName = "id", nullable = false)
  private Initiative initiative;
}
