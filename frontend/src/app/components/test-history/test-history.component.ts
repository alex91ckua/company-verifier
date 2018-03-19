import { Component, OnInit } from '@angular/core';
import {ApiService} from "../../services/api.service";
import {ActivatedRoute, Router} from "@angular/router";

@Component({
  selector: 'app-test-history',
  templateUrl: './test-history.component.html',
  styleUrls: ['./test-history.component.scss']
})
export class TestHistoryComponent implements OnInit {

  tests: any;
  filterModel: boolean = false;
  filters: Object = {
      "by_page_speed[from]": 1,
      "by_page_speed[to]": 100,
      "by_yslow_score[from]": 1,
      "by_yslow_score[to]": 100,
      "by_page_load_time[from]": 1,
      "by_page_load_time[to]": 100000,
      "by_fully_load_time[from]": 1,
      "by_fully_load_time[to]": 100000
  };

  constructor(private _http: ApiService, private route: ActivatedRoute, private router: Router) { }

  ngOnInit() {

      this.route.queryParams.subscribe(params => {

          for (let key in this.filters) {
              // let value = this.filters[key];
              if ( params[key] != null ) {
                  this.filters[key] = params[key];
              } else if (params['clean'] == 1) {
                  this.filters[key] = null;
              }

          }
          console.log( params );
          console.log( this.filters);

          this._http.getGtMetrixTests(this.filters).subscribe(
              data => {
                  console.log(data);
                  this.tests = data;
              },
              err => {

              }
          );

      });

  }

  onFilterSubmit() {

      console.log(this.filters);

      this.router.navigate(['tests'],
          {
              queryParams: this.filters
          }
      )
  }

}
