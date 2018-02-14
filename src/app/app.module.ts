import { BrowserModule } from '@angular/platform-browser';
import { NgModule } from '@angular/core';
import { HttpModule } from '@angular/http';
import { RouterModule, Routes } from '@angular/router';
import { FormsModule } from '@angular/forms';


import { AppComponent } from './app.component';

import { DataService } from './services/data.service';
import { RequisitionsComponent } from './components/requisitions/requisitions.component';
import { ProductsComponent } from './components/products/products.component';
import { PurchasesComponent } from './components/purchases/purchases.component';
import { PurchasesCreateComponent } from './components/purchases-create/purchases-create.component';
import { RequisitionsCreateComponent } from './components/requisitions-create/requisitions-create.component';
import { RequisitionDetailComponent } from './components/requisition-detail/requisition-detail.component';

const appRoutes:Routes = [
  {path:'inventario', component:ProductsComponent},
  {path:'ventas', component:RequisitionsComponent},
  {path:'ventas/crear', component:RequisitionsCreateComponent},
  {path:'compras', component:PurchasesComponent},
  {path:'compras/crear', component:PurchasesCreateComponent},
  {path:'', redirectTo:'inventario', pathMatch: 'full'}
];

@NgModule({
  declarations: [
    AppComponent,
    RequisitionsComponent,
    ProductsComponent,
    PurchasesComponent,
    PurchasesCreateComponent,
    RequisitionsCreateComponent,
    RequisitionDetailComponent
  ],
  imports: [
    BrowserModule,
    HttpModule,
    FormsModule,
    RouterModule.forRoot(appRoutes)
  ],
  providers: [
    DataService
  ],
  bootstrap: [AppComponent]
})
export class AppModule { }
