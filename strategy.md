## Roadmap:
- [x] Add test data from the assignment
- [x] Create all tables
  - [x] Product (No need for variants for now they can be added later easily)
  - [x] Order
  - [x] Line items
  - [x] Promos
  - [x] Adjustments
- [x] Add models specs
- [ ] Add models implementation
- [ ] Create order with products as line items
- [ ] Promos can be applied
- [ ] Add way to edit products, promos and orders


## Notes for models

Order:
- It should have an id and calculated total
- Line items should link products or promos to the order
- Add a method to recalculate all totals using the original line items price and the adjustments

Line items:
- A line item should have original value, final value and a quantity

Promos:
- Promos should be an atomic class with an #apply method which will change create adjustments and update order/line-items total

Adjustment:
- Can be oder wise or line item wise
