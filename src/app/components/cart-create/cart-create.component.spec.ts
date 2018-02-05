import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { CartCreateComponent } from './cart-create.component';

describe('CartCreateComponent', () => {
  let component: CartCreateComponent;
  let fixture: ComponentFixture<CartCreateComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ CartCreateComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(CartCreateComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
