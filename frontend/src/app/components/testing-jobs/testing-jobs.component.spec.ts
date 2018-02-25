import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { TestingJobsComponent } from './testing-jobs.component';

describe('TestingJobsComponent', () => {
  let component: TestingJobsComponent;
  let fixture: ComponentFixture<TestingJobsComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ TestingJobsComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(TestingJobsComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
