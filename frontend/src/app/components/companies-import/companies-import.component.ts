import {Component, OnInit} from '@angular/core';
import {PapaParseService} from "ngx-papaparse";
import {ApiService} from "../../services/api.service";

@Component({
  selector: 'app-companies-import',
  templateUrl: './companies-import.component.html',
  styleUrls: ['./companies-import.component.scss']
})

export class CompaniesImportComponent implements OnInit {

  parsed_data: any;
  mapped_fields = {
    'name': '',
    'website_url': '',
    'email': ''
  };

  disabled: boolean = true;
  done: boolean = false;
  import_message: string;
  csv_file: File;

  constructor(private papa: PapaParseService, private _http: ApiService) { }

  ngOnInit() {
  }

  onCsvSelect(event) {

    // var files = event.srcElement.files;
    var file = event.srcElement.files[0];

    this.csv_file = file;

    this.papa.parse(file, {
      header: true, // get header names
      complete: (results) => {
        console.log('Parsed CSV: ', results);
        this.parsed_data = results;
      }
    });

  }

  onFieldChange() {
    this.disabled = false;
    for (let key in this.mapped_fields) {
      if ( this.mapped_fields[key] == '' ) {
        this.disabled = true;
        break;
      }
    }

  }

  onSubmit(){

    let form_data = new FormData();

    form_data.append('mapped_fields', JSON.stringify(this.mapped_fields));
    form_data.append('csv_file', this.csv_file);

    this._http.importCompanies(form_data).subscribe(
        data => {
          console.log(data);
          this.done = true;
          this.import_message = data['message'];
        },
        err => {
          console.log("Error occurred.")
        }
    );
  }

}
