import { Component, OnInit } from '@angular/core';
import {ApiService} from "../../services/api.service";
import {Company} from "../../classes/company";

@Component({
  selector: 'app-companies',
  templateUrl: './companies.component.html',
  styleUrls: ['./companies.component.scss'],
  providers: []
})
export class CompaniesComponent implements OnInit {

  companies: Array<Company>;

  constructor(private _http: ApiService) { }

  ngOnInit() {
    this._http.getCompanies().subscribe(
        data => {
            console.log(data);
            this.companies = <Company[]> data;
        },
        err => {

        }
    );
  }

}
