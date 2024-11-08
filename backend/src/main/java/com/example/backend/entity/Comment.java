package com.example.backend.entity;

import java.time.LocalDate;


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
@Table(name = "comment")
public class Comment {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private Long id;

    @Nonnull
    @Column(name = "content")
    private String content;

    @Nonnull
    @Column(name = "createdAt")
    private LocalDate createAt;

    @Nonnull
    @Column(name = "initiativeId")
    private Long initiativeId;

    @Nonnull
    @Column(name = "jonogonId")
    private Long jonogonId;
}
