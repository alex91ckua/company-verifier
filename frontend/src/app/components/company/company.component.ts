import { Component, OnInit } from '@angular/core';
import {ActivatedRoute, Router} from "@angular/router";
import {ApiService} from "../../services/api.service";
import {Company} from "../../classes/company";

@Component({
  selector: 'app-company',
  templateUrl: './company.component.html',
  styleUrls: ['./company.component.scss']
})
export class CompanyComponent implements OnInit {

  company_data: any;

  constructor(
      private route: ActivatedRoute,
      private router: Router,
      private _http: ApiService
  ) { }

  ngOnInit() {

    this.route.params.subscribe(params => {
      let company_id = +params['id'];

      this._http.getCompany(company_id).subscribe(
          data => {
            this.company_data = data;
          },
          err => {

          }
      );
    });

  }

}
