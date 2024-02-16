import { Controller, Get, Post, Body, Patch, Param, Delete } from '@nestjs/common';
import { AutorService } from './autor.service';
import { autor } from '@prisma/client';

@Controller('autor')
export class AutorController {
  constructor(private readonly autorService: AutorService) {}

  @Post()
  async create(@Body() data: autor) {
    return this.autorService.create(data);
  }

  @Get()
  async findAll() {
    return this.autorService.findAll();
  }

  @Get(':id')
  async findOne(@Param('id') id: string) {
    return this.autorService.findOne(+id);
  }

  @Patch(':id')
  async update(@Param('id') id: string, @Body() data: autor) {
    return this.autorService.update(+id, data);
  }

  @Delete(':id')
  async remove(@Param('id') id: string) {
    return this.autorService.remove(+id);
  }
}
