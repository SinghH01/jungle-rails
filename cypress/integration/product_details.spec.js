/// <reference types="cypress" />
describe('Product Details', () => {

it('Renders home page', () => {
  cy.visit("/")
})

it("Should click a product", () => {
  //Click first product in the list
cy.get('article').first().click() 
})

it("Should display product description page", () => {
 
  cy.get(".quantity").should("be.visible");
  cy.get(".quantity").should("be.visible");
})

})
