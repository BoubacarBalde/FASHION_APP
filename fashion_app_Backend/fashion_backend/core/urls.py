from django.contrib import admin
from django.urls import path
from core import views

urlpatterns = [
    path('categories/', views.CategoryList.as_view(), name='categories-List'),
    path('categories/home', views.HomeCategoryList.as_view(), name='home-categories-List'),
    
    path('', views.ProductList.as_view(), name='product-List'),
    path('popular/', views.PopularProductList.as_view(), name='popular-List'),
    path('byType/', views.ProductListByClothesType.as_view(), name='List-by-type'),
    path('search/', views.SearchProductByTitle.as_view(), name='search'),
    path('category/', views.FilterProductByCategory.as_view(), name='product-by-category'),
    path('recommendations/', views.SimilarProducts.as_view(), name='similare-products'),
]
