import { Component, OnInit } from '@angular/core';
import {AppSettings} from "../../app.settings";

@Component({
  selector: 'app-home',
  templateUrl: './home.component.html',
  styleUrls: ['./home.component.scss']
})
export class HomeComponent implements OnInit {

  app_name = AppSettings.APP_NAME;

  constructor() { }

  ngOnInit() {
  }

}
