import { autor } from '@prisma/client';
import { PrismaService } from '../prisma/prisma.service';
import { Injectable } from '@nestjs/common';

@Injectable()
export class AutorService {
  constructor(private prisma: PrismaService) {}
  
  async create(data: autor) {
    return this.prisma.autor.create({
      data,
    });
  }

  async findAll() {
    return this.prisma.autor.findMany();
  }

  async findOne(id: number) {
    return this.prisma.autor.findUnique({
      where: {
        id,
      },
    });
  }

  async update(id: number, data: autor) {
    return this.prisma.autor.update({
      where: {
        id,
      },
      data,
    });
  }

  async remove(id: number) {
    return this.prisma.autor.delete({
      where: {
        id,
      },
    });
  }
}
