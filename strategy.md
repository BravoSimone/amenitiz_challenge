## Roadmap:
- [x] Add test data from the assignment
- [x] Create all tables
  - [x] Product (No need for variants for now they can be added later easily)
  - [x] Order
  - [x] Line items
  - [x] Promos
  - [x] Adjustments
- [x] Add models specs
- [x] Add models implementation
- [x] Create order with products as line items
- [x] Promos can be applied
- [-] Add way to edit products, promos and orders
- [ ] Add simple UI to make everything work


## Notes for models

Order:
- It should have an id and calculated total
- Line items should link products or promos to the order
- Add a method to recalculate all totals using the original line items price and the adjustments

Line items:
- A line item should have original value, final value and a quantity

Adjustment:
- Can be oder wise or line item wise and it uses an auxilary class which is responsible to apply the promo
