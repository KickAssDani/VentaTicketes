using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using VentaTicketes.Models;

namespace VentaTicketes.Controllers
{
    public class VentasController : Controller
    {
        private readonly TicketSellerEntities _seller;
        private List<SelectListItem> _rutas;
        int campos = 0;
        public VentasController()
        {
            _seller = new TicketSellerEntities();
        }
        // GET: Ventas
        public ActionResult Index()
        {
            using (TicketSellerEntities _seller = new TicketSellerEntities())
            {
                var rutas = _seller.TicketsRuta.ToList();
                _rutas = new List<SelectListItem>();

                foreach (var i in rutas)
                {
                    _rutas.Add(new SelectListItem
                    {
                        Text = i.NombreRuta,
                        Value = i.idRuta.ToString()
                    });
                }
                ViewBag.Rutas = _rutas;
            }
            return View();
        }
        public JsonResult ArticulosPorCategoria(int Id)
        {
            var articulos = _seller.TicketsLugares.ToList().Where(p => p.idRuta == Id);
            return Json(new SelectList(articulos, "idLugarRuta", "NombreLugar"));
        }
        public JsonResult Horarios(int Id)
        {
            var articulos = _seller.TicketsHorarios.Where(x => x.idLugarRuta == Id).ToList();
            return Json(new SelectList(articulos, "idHorario", "tiempoHorario"));
        }
        public ActionResult ComprarBoleto(TickersSale _sales)
        {
            try
            {

                var results = _seller.TickersSale.Where(a => a.fecha == _sales.fecha).Count();
                if(campos == 0)
                {
                    campos = results;
                }
                    if(campos <= 40)
                    {
                        _seller.TickersSale.Add(_sales);
                        _seller.SaveChanges();
                        TempData["Mensaje"] = "Se agregó correctamente el dato.";
                        campos = campos + _sales.campo;
                        return RedirectToAction("Index");
                    }
                    else
                    {
                        TempData["Mensaje"] = "Ya no hay campos.";
                        return RedirectToAction("Index");
                    }
            }
            catch (Exception ex)
            {
                TempData["Mensaje"] = "Hubo un error:" + ex.Message;
                return RedirectToAction("Index");
            }
        }
    }
}
