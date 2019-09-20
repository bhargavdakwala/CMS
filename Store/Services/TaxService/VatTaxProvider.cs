﻿#region CMS License
/*
The MIT License

Copyright (c) 2008 - 2010 Mettle Systems LLC, P.O. Box 181192 Cleveland Heights, Ohio 44118, United States

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.
*/
#endregion

using System;
using System.Collections.Generic;
using System.Text;

namespace Etech.CMS.Store.Services.TaxService {

  public class VatTaxProvider : ITaxProvider {

    /// <summary>
    /// Initializes a new instance of the <see cref="VatTaxProvider"/> class.
    /// </summary>
    public VatTaxProvider() {
    }

    #region ITaxProvider Members

    public bool IsProductLevelTaxProvider {
      get {
        return true;
      }
    }

    public decimal GetTaxRate(Product product) {
      VatTaxRate vatTaxRate = new VatTaxRate(product.TaxRateId);
      return vatTaxRate.VatTaxRateId == 0 ? 0 : vatTaxRate.Rate;
    }

    public void GetTaxRate(Order order) {
      VatTaxRate vatTaxRate;
      Product product;
      foreach (var orderItem in order.OrderItemCollection) {
        product = new Product(orderItem.ProductId);
        vatTaxRate = new VatTaxRate(product.TaxRateId);
        orderItem.ItemTax = (orderItem.PricePaid - orderItem.DiscountAmount) * vatTaxRate.Rate;
      }
    }

    #endregion
  }
}
