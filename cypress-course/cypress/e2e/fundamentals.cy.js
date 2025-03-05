describe('Fundamentals test', () => {
  beforeEach(() => {
    cy.visit('/fundamentals')
  })
  it('Contains correct header text', () => {
    cy.getDataTest('fundamentals-header').should('contain.text','Testing Fundamentals')
  })
  it('Accordion works correctly', () => {
    cy.contains(/Your tests will exist in a describe block. This block takes two arguments./i).should('not.be.visible')
    cy.get('[data-test="accordion-item-1"]  button[type="button"]').click()
    cy.contains(/Your tests will exist in a describe block. This block takes two arguments./i).should('be.visible')
    cy.get('[data-test="accordion-item-1"] button[type="button"]').click()
    cy.contains(/Your tests will exist in a describe block. This block takes two arguments./i).should('not.be.visible')
  })
})