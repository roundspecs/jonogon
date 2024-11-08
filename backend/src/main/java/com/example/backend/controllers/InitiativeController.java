package com.example.backend.controllers;

import java.util.List;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.*;
import org.springframework.web.bind.annotation.*;

import com.example.backend.entity.Comment;
import com.example.backend.entity.Initiative;
import com.example.backend.services.InitiativeService;
import com.example.backend.services.JonogonService;



@RestController
@RequestMapping("/initiative")

public class InitiativeController {

    @Autowired
    InitiativeService initiativeService;
    @Autowired
    JonogonService jonogonService;

    @PostMapping("/jonogon/{jonogonId}")
    public ResponseEntity<Initiative> save(@PathVariable Long jonogonId, @RequestBody Initiative initiative) {
        initiative.setJonogon(jonogonService.findById(jonogonId));

        return new ResponseEntity<>(initiativeService.save(initiative), HttpStatus.CREATED);
    }

    @GetMapping("/all")
    public ResponseEntity<List<Initiative>> getAll() {
        return new ResponseEntity<>(initiativeService.findAll(), HttpStatus.OK);
    }

    @GetMapping("/{id}")
    public ResponseEntity<Initiative> findById(@PathVariable Long id) {
        return new ResponseEntity<>(initiativeService.findById(id), HttpStatus.OK);
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

    @GetMapping("{initiativeId}/comments")
    public ResponseEntity<Set<Comment>> findAllComment(@PathVariable Long initiativeId) {
        return new ResponseEntity<>(initiativeService.findAllComment(initiativeId), HttpStatus.OK);
    }
}
