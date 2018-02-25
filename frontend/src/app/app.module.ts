import { BrowserModule } from '@angular/platform-browser';
import {NgModule, ModuleWithProviders} from '@angular/core';


import {AppComponent} from './app.component';
import {HeaderComponent} from './components/header/header.component';
import {FooterComponent} from './components/footer/footer.component';
import {RouterModule, Routes} from "@angular/router";
import { CompaniesImportComponent} from './components/companies-import/companies-import.component';
import {HomeComponent} from './components/home/home.component';
import {PapaParseModule} from "ngx-papaparse";
import { CompaniesComponent } from './components/companies/companies.component';
import {HttpClientModule} from "@angular/common/http";
import {ApiService} from "./services/api.service";
import {FormsModule} from "@angular/forms";
import {AlertModule, ProgressbarModule} from "ngx-bootstrap";
import { TestingJobsComponent } from './components/testing-jobs/testing-jobs.component';
import {AngularFontAwesomeModule} from "angular-font-awesome";

const appRoutes: Routes = [
  { path: 'import', component: CompaniesImportComponent },
  { path: 'companies', component: CompaniesComponent },
  { path: 'jobs', component: TestingJobsComponent },
  { path: 'home', component: HomeComponent },
  { path: '', redirectTo: '/home', pathMatch: 'full' }
];
const rootRouting: ModuleWithProviders = RouterModule.forRoot(appRoutes);

@NgModule({
  declarations: [
    AppComponent,
    HeaderComponent,
    FooterComponent,
    CompaniesImportComponent,
    HomeComponent,
    CompaniesComponent,
    TestingJobsComponent
  ],
  imports: [
    BrowserModule,
    FormsModule,
    HttpClientModule,
    rootRouting,
    PapaParseModule,
    AlertModule.forRoot(),
    ProgressbarModule.forRoot(),
    AngularFontAwesomeModule
  ],
  providers: [
      ApiService
  ],
  bootstrap: [AppComponent],
})
export class AppModule { }
