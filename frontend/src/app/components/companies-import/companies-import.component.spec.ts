import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { CompaniesImportComponent } from './companies-import.component';

describe('CompaniesImportComponent', () => {
  let component: CompaniesImportComponent;
  let fixture: ComponentFixture<CompaniesImportComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ CompaniesImportComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(CompaniesImportComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
