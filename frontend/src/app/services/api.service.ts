import { Injectable } from '@angular/core';
import {HttpClient} from "@angular/common/http";
import {AppSettings} from "../app.settings";
import {HttpHeaders} from "@angular/common/http";
import {isNumber} from "util";
import {HttpParams} from "@angular/common/http";

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

  getCompanies(page: number = null){
    var page_uri = '';
    if ( isNumber(page) ) {
      page_uri = '?page=' + page;
    }
    return this.http.get(AppSettings.API_ENDPOINT + '/companies' + page_uri);
  }

  getCompany(company_id){
    return this.http.get(AppSettings.API_ENDPOINT + '/companies/' + company_id);
  }

  getGtMetrixTests(query_params: Object = null){

    let params = new HttpParams();

    for (let key in query_params) {
      let value = query_params[key];
      // Use `key` and `value`
      if ( value != null) {
        params = params.append(key, value);
      }
    }

    return this.http.get(AppSettings.API_ENDPOINT + '/gt_metrix_tests/', {params: params});
  }

  getActivity(query_params: Object = null){

    let params = new HttpParams();

    for (let key in query_params) {
      let value = query_params[key];
      // Use `key` and `value`
      if ( value != null) {
        params = params.append(key, value);
      }
    }

    return this.http.get(AppSettings.API_ENDPOINT + '/test_logs/', {params: params});
  }

}
