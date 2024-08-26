package com.applicanttagapan.webproject.services;

import org.springframework.data.jpa.repository.JpaRepository;

import com.applicanttagapan.webproject.models.Products;

public interface ProductsRepository extends JpaRepository<Products, Integer>{

}
