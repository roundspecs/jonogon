package com.example.backend.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

// import com.example.backend.entity.Comment;
import com.example.backend.entity.Initiative;
import com.example.backend.repository.InitiativeRepository;

@Service
public class InitiativeService {

    @Autowired
    private InitiativeRepository initiativeRepository;

    public Initiative save(Initiative initiative) {
        return initiativeRepository.save(initiative);
    }

    // public List<Initiative> findAll() {
    // return (List<Initiative>) initiativeRepository.findAll();
    // }

    // public Initiative findById(Long id) {
    // return initiativeRepository.findById(id).get();
    // }

    // @Transactional
    // public void appreciateBy(Long initiativeId, Long jonogonId) {
    // Initiative initiative = initiativeRepository.findById(initiativeId).get();
    // Jonogon jonogon = jonogonService.findById(jonogonId);

    // initiative.getAppreciators().add(jonogon);
    // save(initiative);
    // }

    // @Transactional
    // public void iAmInBy(Long initiativeId, Long jonogonId) {
    // Initiative initiative = initiativeRepository.findById(initiativeId).get();
    // Jonogon jonogon = jonogonService.findById(jonogonId);

    // initiative.getIAmInJonogons().add(jonogon);
    // save(initiative);
    // }

    // public int appreciateCount(Long initiativeId) {
    // Initiative initiative = initiativeRepository.findById(initiativeId).get();
    // return initiative.getAppreciators().size();
    // }

    // public Boolean didAppreciate(Long initiativeId, Long jonogonId) {
    // Initiative initiative = initiativeRepository.findById(initiativeId).get();
    // Jonogon jonogon = jonogonService.findById(jonogonId);
    // return initiative.getAppreciators().contains(jonogon);
    // }

    // public Boolean didIAmIn(Long initiativeId, Long jonogonId) {
    // Initiative initiative = initiativeRepository.findById(initiativeId).get();
    // Jonogon jonogon = jonogonService.findById(jonogonId);
    // return initiative.getIAmInJonogons().contains(jonogon);
    // }

    // public Set<Comment> findAllComment(Long initiativeId) {
    // Initiative initiative = initiativeRepository.findById(initiativeId).get();
    // return initiative.getComments();
    // }

    // public Integer iAmInCount(Long initiativeId) {
    // Initiative initiative = initiativeRepository.findById(initiativeId).get();
    // return initiative.getIAmInJonogons().size();
    // }

    // public Integer commentCount(Long initiativeId) {
    // Initiative initiative = initiativeRepository.findById(initiativeId).get();
    // return initiative.getComments().size();
    // }

}
