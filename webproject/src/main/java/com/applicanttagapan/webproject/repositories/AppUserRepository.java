package com.applicanttagapan.webproject.repositories;

import org.springframework.data.jpa.repository.JpaRepository;

import com.applicanttagapan.webproject.models.AppUser;

public interface AppUserRepository extends JpaRepository<AppUser, Integer> {

	public AppUser findByEmail(String email);
}