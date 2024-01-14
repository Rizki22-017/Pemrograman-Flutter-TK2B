/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Other/File.java to edit this template
 */
package com.rizki.nilai.repository;

import com.rizki.nilai.entitiy.Nilai;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

/**
 *
 * @author rizky
 */
@Repository
public interface NilaiRepository extends JpaRepository<Nilai, Long>{
    
}
