/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Other/File.java to edit this template
 */
package com.rizki.matakuliah.service;

import com.rizki.matakuliah.entity.Matakuliah;
import com.rizki.matakuliah.repository.MatakuliahRepository;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author rizky
 */
@Service
public class MatakuliahService {

    @Autowired
    private MatakuliahRepository matakuliahRepository;
    
    public List<Matakuliah> getAll(){
        return matakuliahRepository.findAll();
    }
    
    public Matakuliah getMatakuliahById(Long idmatakuliah){
        return matakuliahRepository.findById(idmatakuliah).get();
    } 
    
    public void insert(Matakuliah matakuliah){
        matakuliahRepository.save(matakuliah);
    }
    
    public void delete(Long idmatakuliah){
        matakuliahRepository.deleteById(idmatakuliah); 
    }
}
