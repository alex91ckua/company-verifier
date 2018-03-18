import { Component, OnInit } from '@angular/core';
import {ApiService} from "../../services/api.service";
import {Company} from "../../classes/company";
import {ActivatedRoute, Router} from "@angular/router";

@Component({
  selector: 'app-companies',
  templateUrl: './companies.component.html',
  styleUrls: ['./companies.component.scss'],
  providers: []
})
export class CompaniesComponent implements OnInit {

  companies: Array<Company>;

    constructor(
        private route: ActivatedRoute,
        private router: Router,
        private _http: ApiService
    ) { }

  ngOnInit() {

      this.route.params.subscribe(params => {
          let page = +params['page'];

          this._http.getCompanies(page).subscribe(
              data => {
                  console.log(data);
                  this.companies = <Company[]> data;
              },
              err => {

              }
          );
      });

  }

}
