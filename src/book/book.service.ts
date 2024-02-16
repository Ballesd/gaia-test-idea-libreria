import { Injectable } from '@nestjs/common';
import { CreateBookDto } from './dto/create-book.dto';
import { UpdateBookDto } from './dto/update-book.dto';
import { book } from '@prisma/client';
import { PrismaService } from 'src/prisma/prisma.service';

@Injectable()
export class BookService {
  constructor(private prisma: PrismaService) {}
  async create(data: book) {
    return this.prisma.book.create({
      data,
    });
  }

  async findAll() {
    return this.prisma.book.findMany();
  }

  async findOne(id: number) {
    return this.prisma.book.findUnique({
      where: {
        id,
      },
    });
  }

  async update(id: number, updateBookDto: UpdateBookDto) {
    return this.prisma.book.update({
      where: {
        id,
      },
      data: updateBookDto,
    });
  }

  async remove(id: number) {
    return this.prisma.book.delete({
      where: {
        id,
      },
    });
  }
}
