import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { RequisitionsCreateComponent } from './requisitions-create.component';

describe('RequisitionsCreateComponent', () => {
  let component: RequisitionsCreateComponent;
  let fixture: ComponentFixture<RequisitionsCreateComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ RequisitionsCreateComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(RequisitionsCreateComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
