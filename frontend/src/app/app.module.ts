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
import {AlertModule, ProgressbarModule, ButtonsModule} from "ngx-bootstrap";
import {AngularFontAwesomeModule} from "angular-font-awesome";
import { CompanyComponent } from './components/company/company.component';
import { TestHistoryComponent } from './components/test-history/test-history.component';
import {IonRangeSliderModule} from "ng2-ion-range-slider";
import { ActivityComponent } from './activity/activity.component';

const appRoutes: Routes = [
  { path: 'import', component: CompaniesImportComponent },
  { path: 'companies', component: CompaniesComponent },
  { path: 'companies/:page', component: CompaniesComponent },
  { path: 'tests', component: TestHistoryComponent },
  { path: 'activity', component: ActivityComponent },
  { path: 'company/:id', component: CompanyComponent },
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
    CompanyComponent,
    TestHistoryComponent,
    ActivityComponent
  ],
  imports: [
    BrowserModule,
    FormsModule,
    HttpClientModule,
    rootRouting,
    PapaParseModule,
    AlertModule.forRoot(),
    ProgressbarModule.forRoot(),
    ButtonsModule,
    AngularFontAwesomeModule,
    IonRangeSliderModule
  ],
  providers: [
      ApiService
  ],
  bootstrap: [AppComponent],
})
export class AppModule { }
