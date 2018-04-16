import { Component, OnInit } from '@angular/core';
import {ActivatedRoute, Router} from "@angular/router";
import {ApiService} from "../services/api.service";

@Component({
  selector: 'app-activity',
  templateUrl: './activity.component.html',
  styleUrls: ['./activity.component.scss']
})
export class ActivityComponent implements OnInit {

  activity: any;

  constructor(private _http: ApiService, private route: ActivatedRoute, private router: Router) { }

  ngOnInit() {

    this.route.queryParams.subscribe(params => {

      console.log( params );

      this._http.getActivity().subscribe(
        data => {
          console.log(data);
          this.activity = data;
        },
        err => {

        }
      );

    });

  }

}
