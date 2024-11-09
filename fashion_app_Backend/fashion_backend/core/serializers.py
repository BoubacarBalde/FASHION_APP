from rest_framework import serializers
from . import models


class CategorySerilizer(serializers.ModelSerializer):
    class Meta:
       model = models.Category
       fields = ('title', 'id', 'imgUrl')
       
class BrandSerilizer(serializers.ModelSerializer):
    class Meta:
       model = models.Brand
       fields = ('title', 'id', 'imgUrl')   

class ProductSerilizer(serializers.ModelSerializer):
    class Meta:
       model = models.Product
       fields = '__all__'   