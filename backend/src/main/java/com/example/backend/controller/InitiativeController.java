package com.example.backend.controller;

import java.util.List;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.*;
import org.springframework.web.bind.annotation.*;

import com.example.backend.entity.Comment;
import com.example.backend.entity.Initiative;
import com.example.backend.service.InitiativeService;
import com.example.backend.service.JonogonService;

@RestController
@RequestMapping("/initiative")

public class InitiativeController {

    @Autowired
    InitiativeService initiativeService;
    @Autowired
    JonogonService jonogonService;

    @GetMapping("/all")
    public ResponseEntity<List<Initiative>> getAll() {
        return new ResponseEntity<>(initiativeService.findAll(), HttpStatus.OK);
    }

    @PostMapping("/jonogon/{jonogonId}")
    public ResponseEntity<Initiative> save(@PathVariable Long jonogonId, @RequestBody Initiative initiative) {
        initiative.setJonogon(jonogonService.findById(jonogonId));
        return new ResponseEntity<>(initiativeService.save(initiative), HttpStatus.CREATED);
    }

    @GetMapping("/{id}")
    public ResponseEntity<Initiative> findById(@PathVariable Long id) {
        return new ResponseEntity<>(initiativeService.findById(id), HttpStatus.OK);
    }

    @GetMapping("{initiativeId}/comment/all")
    public ResponseEntity<Set<Comment>> findAllComment(@PathVariable Long initiativeId) {
        return new ResponseEntity<>(initiativeService.findAllComment(initiativeId), HttpStatus.OK);
    }

    @PostMapping("{initiativeId}/appreciate/{jonogonId}")
    public ResponseEntity<HttpStatus> appreciate(@PathVariable Long initiativeId, @PathVariable Long jonogonId) {
        initiativeService.appreciateBy(initiativeId, jonogonId);
        return new ResponseEntity<>(HttpStatus.CREATED);
    }

    @GetMapping("{initiativeId}/appreciate/{jonogonId}")
    public ResponseEntity<Boolean> didAppreciate(@PathVariable Long initiativeId, @PathVariable Long jonogonId) {
        return new ResponseEntity<>(initiativeService.didAppreciate(initiativeId, jonogonId), HttpStatus.OK);
    }

    @GetMapping("{initiativeId}/appreciate/count")
    public ResponseEntity<Integer> appreciateCount(@PathVariable Long initiativeId) {
        return new ResponseEntity<>(initiativeService.appreciateCount(initiativeId), HttpStatus.OK);
    }

    // post
    @PostMapping("{initiativeId}/iAmIn/{jonogonId}")
    public ResponseEntity<HttpStatus> iAmIn(@PathVariable Long initiativeId, @PathVariable Long jonogonId) {
        initiativeService.iAmInBy(initiativeId, jonogonId);
        return new ResponseEntity<>(HttpStatus.OK);
    }

    // get
    @GetMapping("{initiativeId}/iAmIn/{jonogonId}")
    public ResponseEntity<Boolean> didIAmIn(@PathVariable Long initiativeId, @PathVariable Long jonogonId) {
        return new ResponseEntity<>(initiativeService.didIAmIn(initiativeId, jonogonId), HttpStatus.OK);
    }

    @GetMapping("{initiativeId}/iAmIn/count")
    public ResponseEntity<Integer> iAmInCount(@PathVariable Long initiativeId) {
          return new ResponseEntity<>(initiativeService.iAmInCount(initiativeId), HttpStatus.OK);
    }

    @GetMapping("{initiativeId}/comment/count")
    public ResponseEntity<Integer> commmentCount(@PathVariable Long initiativeId) {
        return new ResponseEntity<>(initiativeService.commentCount(initiativeId), HttpStatus.OK);
    }

}
