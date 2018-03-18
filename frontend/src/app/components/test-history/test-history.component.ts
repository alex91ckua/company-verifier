import { Component, OnInit } from '@angular/core';
import {ApiService} from "../../services/api.service";

@Component({
  selector: 'app-test-history',
  templateUrl: './test-history.component.html',
  styleUrls: ['./test-history.component.scss']
})
export class TestHistoryComponent implements OnInit {

  tests: any;
  filterModel: boolean = false;

  constructor(private _http: ApiService) { }

  ngOnInit() {
    this._http.getGtMetrixTests().subscribe(
        data => {
          console.log(data);
          this.tests = data;
        },
        err => {

        }
    );
  }

}
