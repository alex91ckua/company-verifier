import { Injectable } from '@angular/core';
import {HttpClient} from "@angular/common/http";
import {AppSettings} from "../app.settings";
import {HttpHeaders} from "@angular/common/http";

@Injectable()
export class ApiService {

  constructor(private http: HttpClient) {
  }

  importCompanies(form_data) {
    let headers = new HttpHeaders();
    headers.append('Content-Type', 'application/form-data');
    let options = {headers: headers};
    return this.http.post(AppSettings.API_ENDPOINT + '/company_import', form_data, options);
  }

  getCompanies(){
    return this.http.get(AppSettings.API_ENDPOINT + '/companies');
  }

  getTestingJobs(){
    return this.http.get(AppSettings.API_ENDPOINT + '/testing_jobs');
  }

}
