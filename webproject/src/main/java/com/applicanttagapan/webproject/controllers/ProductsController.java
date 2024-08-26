package com.applicanttagapan.webproject.controllers;

import java.nio.file.Files;
import java.io.InputStream;
import java.nio.file.*;
import java.nio.file.StandardCopyOption;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.applicanttagapan.webproject.models.ProductDto;
import com.applicanttagapan.webproject.models.Products;
import com.applicanttagapan.webproject.services.ProductsRepository;

import jakarta.validation.Valid;

@Controller
@RequestMapping("/products")

public class ProductsController {

	@Autowired 
	private ProductsRepository repo;
	
	@GetMapping ( { "", "/"})		
	public String showProductList (Model model) {
		List <Products> products = repo.findAll();
		model.addAttribute ("products", products);
		return "Products/index";
		
	}
	
	//dinagdag ko lang
	@GetMapping ("/view")
	public String viewProductList (Model model) {
		List <Products> products = repo.findAll();
		model.addAttribute ("products", products);
		return "Products/view";
		
	}
		//dinagdag ko lang 9am
	
	@GetMapping ( "/create" )
			public String showCreatePage (Model model) {
			ProductDto productDto = new ProductDto () ;
			model.addAttribute ( "productDto", productDto) ;
			return "products/CreateProduct" ;
	
	}
	
	@PostMapping ("/create")
			public String CreateProduct(
					@Valid @ModelAttribute ProductDto productDto, 
					BindingResult result) 
					{
		
			if (productDto.getImage_file_name().isEmpty()) {
					result.addError(new FieldError ("productDto", "image_file_name", "The image file is required! "));
			}
			
			if (result.hasErrors()) {
					return "products/CreateProduct";
			}
			
			// Save image file
			
			MultipartFile image = productDto.getImage_file_name();
			Date created_at = new Date();
			String storageFileName = created_at.getTime() + "_" + image.getOriginalFilename();
			
			try {
					String uploadDir = "public/images/";
					Path uploadPath = Paths.get(uploadDir);
					
					if (!Files.exists(uploadPath)) {
						Files.createDirectories(uploadPath);
			}
			
					try (InputStream inputStream = image.getInputStream()){
						Files.copy(inputStream, Paths.get(uploadDir + storageFileName),
								StandardCopyOption.REPLACE_EXISTING);
					}
			} catch (Exception ex) {
					System.out.println ("Exception: " + ex.getMessage());
			}
			
			
			// Add values to the Add New Product
				Products products = new Products();
				products.setName(productDto.getName());
				products.setBrand(productDto.getBrand());
				products.setCategory(productDto.getCategory());
				products.setPrice(productDto.getPrice());
				products.setDescription(productDto.getDescription());
				products.setCreated_at(created_at);
				products.setImage_file_name(storageFileName);
				
				repo.save(products);
			
			return "redirect:/products";
	}
	//This is a new Method that displays the page which allows the user to update product details
	// Edit other the user input
	@GetMapping ("/edit")
	public String showEditPage(
			Model model, 
			@RequestParam int id) {
		
		
	try { //we need to read the product details from the database
		Products product = repo.findById(id).get(); //dito ko binago yung procuct na yellow to products 
		model.addAttribute("product", product); 
		
		//create object of productDto and add it to the model/ use it to bind it to the form 
		ProductDto productDto = new ProductDto();
		productDto.setName(product.getName());  
		productDto.setBrand(product.getBrand());  
		productDto.setCategory(product.getCategory());
		productDto.setPrice(product.getPrice());  
		productDto.setDescription(product.getDescription());  
		
		model.addAttribute("productDto", productDto);
	}
	
	catch(Exception ex) {
		System.out.println("Exception: " + ex.getMessage());
		return  "redirect:/products";
	}
		return "products/EditProduct";
		
	}
	
	@PostMapping("/edit")
	public String updateProduct( Model model, @RequestParam int id, 
			@Valid @ModelAttribute ProductDto productDto, 
			BindingResult result) {
		
		try {
			Products products = repo.findById(id).get();
			model.addAttribute("product", products );
			
			if (result.hasErrors()) {
					return "products/EditProduct";
			}
			
			//if we don't have errors, we check the image
			
			if (!productDto.getImage_file_name().isEmpty()) {
				//delete old image
				
				String uploadDir ="public/images/";
				Path oldImagePath = Paths.get(uploadDir + products.getImage_file_name());
				
				try {
					Files.delete(oldImagePath);
				} 
				catch (Exception ex) {
						System.out.println("Exception: " + ex.getMessage());
				}
				
				//save new image file
				
				MultipartFile imageFileName = productDto.getImage_file_name();
				Date created_at = new Date();
				String storageFileName = created_at.getTime() + "_" + imageFileName.getOriginalFilename();
			
				try (InputStream inputStream = imageFileName.getInputStream()){
					Files.copy(inputStream, Paths.get(uploadDir + storageFileName),
							StandardCopyOption.REPLACE_EXISTING);
				}
				products.setImage_file_name(storageFileName);
			}
			
			products.setName(productDto.getName());
			products.setBrand(productDto.getBrand());
			products.setCategory(productDto.getCategory());
			products.setPrice(productDto.getPrice());
			products.setDescription(productDto.getDescription());
			
			repo.save(products);
			
			
		 }
		
		catch (Exception ex ) {
			System.out.println("Exception: " + ex.getMessage());
		}
		return "redirect:/products";
	}
	
	   
		@GetMapping ("/delete")
		public String deleteProduct( @RequestParam int id) {
			
			try {
				Products products =repo.findById(id).get();
				
				//delete product image
				Path imagePath = Paths.get("public/images/" + products.getImage_file_name()); 
				
				try { 
					Files.delete(imagePath);
				}
				catch (Exception ex) {
					System.out.println("Exception: " + ex.getMessage());
				}
			//delete products from the database
				repo.delete(products);
			}
			catch (Exception ex ) {
				System.out.println("Exception: " + ex.getMessage()); 
			}
			return "redirect:/products";
		}
	}
	
	


