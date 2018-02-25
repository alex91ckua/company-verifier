import { Component, OnInit } from '@angular/core';
import {TestingJob} from "../../classes/testing-job";
import {ApiService} from "../../services/api.service";

@Component({
  selector: 'app-testing-jobs',
  templateUrl: './testing-jobs.component.html',
  styleUrls: ['./testing-jobs.component.scss']
})
export class TestingJobsComponent implements OnInit {

  jobs: Array<TestingJob>;

  constructor(private _http: ApiService) { }

  ngOnInit() {
    this._http.getTestingJobs().subscribe(
        data => {
          console.log(data);
          this.jobs = <TestingJob[]> data;
        },
        err => {

        }
    );
  }

}
