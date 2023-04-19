#!/usr/bin/python3
""" Amenity Module for HBNB project """
import os
from sqlalchemy import Column, String
from sqlalchemy.orm import relationship

from models.base_model import BaseModel, Base


class Amenity(BaseModel, Base):
    """Represents an amenity data set."""
    __tablename__ = 'amenities'
    name = Column(
        String(128), nullable=False
    )
    if os.getenv('HBNB_TYPE_STORAGE') == 'db':
        place_amenities = relationship(
                "Place", secondary="place_amenity", back_populates="amenities")
        place_amenity = Table(
                "place_amenity",
                Base.metadata,
                Column("place_id", String(60), ForeignKey("places.id"),
                       primary_key=True, nullable=False),
                Column("amenity_id", String(60), ForeignKey("amenities.id"),
                       primary_key=True, nullable=False)
                )
