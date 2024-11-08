// package com.example.backend.entity;

// import java.time.LocalDate;

// import com.fasterxml.jackson.annotation.JsonIgnore;

// import jakarta.annotation.Nonnull;
// import jakarta.persistence.*;
// import lombok.*;

// @Getter
// @Setter
// @NoArgsConstructor
// @RequiredArgsConstructor
// @Entity
// @Table(name = "comment")
// public class Comment {

//     @Id
//     @GeneratedValue(strategy = GenerationType.IDENTITY)
//     @Column(name = "id")
//     private Long id;

//     @Nonnull
//     @Column(name = "content")
//     private String content;

//     @Nonnull
//     @Column(name = "createdAt")
//     private LocalDate createAt;

//     @NonNull
//     @ManyToOne(optional = false)
//     @JoinColumn(name = "jonogon_id", referencedColumnName = "id", nullable = false)
//     private Jonogon jonogon;

//     @JsonIgnore
//     @NonNull
//     @ManyToOne(optional = false)
//     @JoinColumn(name = "initiative_id", referencedColumnName = "id", nullable = false)
//     private Initiative initiative;
// }
