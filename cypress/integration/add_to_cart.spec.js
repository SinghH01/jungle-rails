/// <reference types="cypress" />
describe('Product Details', () => {

  it('Renders home page', () => {
    cy.visit("/")
    cy.get(".products article").should("be.visible");
  })
  
  it("Should click a add cart button", () => {
    //Click first product in the list
    cy.get('.btn').first().click({force:true}) 
  })

  it("Should have 1 item in my cart", () => {
      
    cy.get('.nav-link').contains(1) 
  })
  
  // it("Should display product description page", () => {
   
  //   cy.get(".quantity").should("be.visible");
  //   cy.get(".quantity").should("be.visible");
  // })
  
  })